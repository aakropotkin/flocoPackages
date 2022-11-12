{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs/floating-point-hex-parser?_rev=64-deaf63f7b84fd750124a7eb81a785a17";
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
    ident = "@webassemblyjs/floating-point-hex-parser";
    ldir  = "info/webassemblyjs/floating-point-hex-parser";
    inherit packument fetchInfo;
  } // latest';

}
