{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-color-function?rev=26-2bd53b71251b728395faa70fd69fab6f";
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
    ident = "postcss-color-function";
    ldir  = "info/unscoped/p/postcss-color-function";
    inherit packument fetchInfo;
  } // latest';

}
