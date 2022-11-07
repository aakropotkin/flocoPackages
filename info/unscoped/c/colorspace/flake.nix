{

  inputs.packument.url   = "https://registry.npmjs.org/colorspace?rev=11-d1b71ff8229f95668739f467512caa13";
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
    ident = "colorspace";
    ldir  = "info/unscoped/c/colorspace";
    inherit packument fetchInfo;
  } // latest';

}
