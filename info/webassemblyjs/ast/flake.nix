{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/ast?rev=86-2386a440b770f2e25e54cab8c344f30b";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/ast";
    ldir  = "info/webassemblyjs/ast";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
