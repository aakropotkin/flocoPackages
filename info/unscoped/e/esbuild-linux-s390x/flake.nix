{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-linux-s390x?rev=62-110b0f7ad37f4989991d41f4e4f909ce";
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
    ident = "esbuild-linux-s390x";
    ldir  = "info/unscoped/e/esbuild-linux-s390x";
    inherit packument fetchInfo;
  } // latest';

}
