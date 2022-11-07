{

  inputs.packument.url   = "https://registry.npmjs.org/pretty-error?rev=110-939df76818d291d9c4b5951c4f8ecb96";
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
    ident = "pretty-error";
    ldir  = "info/unscoped/p/pretty-error";
    inherit packument fetchInfo;
  } // latest';

}
