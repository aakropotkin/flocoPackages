{

  inputs.packument.url   = "https://registry.npmjs.org/arch?rev=16-12e49ce9a6d770576532aafb2384a807";
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
    ident = "arch";
    ldir  = "info/unscoped/a/arch";
    inherit packument fetchInfo;
  } // latest';

}
