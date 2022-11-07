{

  inputs.packument.url   = "https://registry.npmjs.org/tildify?rev=28-1856a3085fb0a3f44a307d865d6e7896";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "tildify";
    ldir  = "info/unscoped/t/tildify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
