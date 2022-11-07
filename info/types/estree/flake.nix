{

  inputs.packument.url   = "https://registry.npmjs.org/@types/estree?rev=717-4fac6ecc3eb873a65b46d134a0afe320";
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
    scope = "@types";
    ident = "@types/estree";
    ldir  = "info/types/estree";
    inherit packument fetchInfo;
  } // latest';

}
