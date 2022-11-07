{

  inputs.packument.url   = "https://registry.npmjs.org/cookie?rev=129-ffbb476cdb770f9de49c6281db915d33";
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
    ident = "cookie";
    ldir  = "info/unscoped/c/cookie";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
