{

  inputs.packument.url   = "https://registry.npmjs.org/globby?rev=111-132e1ab73637a76442a3f2e94f44c47d";
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
    ident = "globby";
    ldir  = "info/unscoped/g/globby";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
